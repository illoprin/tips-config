# 🎀 Декораторы в TypeScript

## 🔍 **Что такое декоратор?**  
Декоратор — это специальная функция, которая добавляет метаданные или изменяет поведение классов, методов, свойств или параметров. Они широко используются в фреймворках (например, Angular, NestJS) для валидации, логирования, dependency injection и других задач.  

Декораторы начинаются с символа `@` и применяются к:  
- Классам (`@ClassDecorator`)  
- Методам (`@MethodDecorator`)  
- Свойствам (`@PropertyDecorator`)  
- Параметрам (`@ParameterDecorator`)  
- Аксессорам (геттерам/сеттерам)  

---

## 🛠 **Простой пример декоратора метода**  

Допустим, мы хотим залогировать вызов метода:  

```typescript
function LogMethod(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
    const originalMethod = descriptor.value; // Сохраняем оригинальный метод

    // Переопределяем метод
    descriptor.value = function (...args: any[]) {
        console.log(`🔄 Вызван метод ${propertyKey} с аргументами:`, args);
        return originalMethod.apply(this, args); // Вызываем оригинальный метод
    };

    return descriptor;
}

class ExampleService {
    @LogMethod
    greet(name: string) {
        return `Привет, ${name}!`;
    }
}

const service = new ExampleService();
service.greet("Анна"); // В консоли: "🔄 Вызван метод greet с аргументами: ['Анна']"
```  

### Как это работает?  
1. `target` — класс, к которому применяется декоратор (или его прототип).  
2. `propertyKey` — имя метода (`"greet"`).  
3. `descriptor` — объект с настройками метода (можно менять поведение).  

---

## 🔧 **Декораторы с аргументами**  
Декоратор может принимать параметры. Например, добавим задержку перед выполнением метода:  

```typescript
function Delay(ms: number) {
    return function (target: any, propertyKey: string, descriptor: PropertyDescriptor) {
        const originalMethod = descriptor.value;

        descriptor.value = function (...args: any[]) {
            console.log(`⏳ Ждём ${ms} мс...`);
            setTimeout(() => {
                originalMethod.apply(this, args);
            }, ms);
        };

        return descriptor;
    };
}

class ExampleService {
    @Delay(1000)
    greet(name: string) {
        console.log(`Привет, ${name}!`);
    }
}

const service = new ExampleService();
service.greet("Макс"); // Через 1 секунду: "Привет, Макс!"
```  

---

## 🚦 **Использование `class-validator` для валидации в Express**  

Допустим, у нас есть DTO (Data Transfer Object), который нужно проверить перед обработкой запроса.  

### 1️⃣ Установка `class-validator`  
```bash
npm install class-validator class-transformer
```  

### 2️⃣ Создаём DTO с валидацией  
```typescript
import { IsString, IsEmail, MinLength } from 'class-validator';

class CreateUserDto {
    @IsString()
    @MinLength(3)
    name: string;

    @IsEmail()
    email: string;
}
```  

### 3️⃣ Middleware для валидации в Express  
```typescript
import { Request, Response, NextFunction } from 'express';
import { validate } from 'class-validator';
import { plainToClass } from 'class-transformer';

async function validationMiddleware(dtoClass: any) {
    return async (req: Request, res: Response, next: NextFunction) => {
        const dto = plainToClass(dtoClass, req.body);
        const errors = await validate(dto);

        if (errors.length > 0) {
            const errorMessages = errors.map(err => {
                return {
                    field: err.property,
                    errors: Object.values(err.constraints || {}),
                };
            });
            return res.status(400).json({ errors: errorMessages });
        }

        req.body = dto; // Заменяем тело запроса на валидированный объект
        next();
    };
}
```  

### 4️⃣ Использование в роуте  
```typescript
import express from 'express';
const app = express();
app.use(express.json());

app.post('/users', validationMiddleware(CreateUserDto), (req, res) => {
    // Если валидация прошла, req.body содержит валидный CreateUserDto
    res.status(201).json({ message: 'Пользователь создан!', data: req.body });
});

app.listen(3000, () => console.log('Сервер запущен на http://localhost:3000'));
```  

### 🔥 **Пример ошибки валидации**  
Если отправить:  
```json
{ "name": "A", "email": "not-an-email" }
```  

Ответ:  
```json
{
    "errors": [
        { "field": "name", "errors": ["Минимальная длина — 3 символа"] },
        { "field": "email", "errors": ["Некорректный email"] }
    ]
}
```