# 🚀 React Сниппеты (JavaScript & TypeScript)  

## 🔹 React JavaScript  

### 🏗 **Основные компоненты**  
- **`ccc`** → Компонент-класс с конструктором  
- **`cc`** → Компонент-класс  
- **`cpc`** → Чистый компонент-класс (`PureComponent`)  
- **`ffc`** → Функциональный компонент  
- **`sfc`** → Функциональный компонент без состояния (стрелочная функция)

### ⚙ **Методы жизненного цикла**  
- **`cdc`** → `componentDidCatch` (обработка ошибок)  
- **`cdm`** → `componentDidMount` (после монтирования)  
- **`cdu`** → `componentDidUpdate` (после обновления)  
- **`cwm`** → `componentWillMount` (устаревшее)  
- **`cwrp`** → `componentWillReceiveProps` (устаревшее)  
- **`cwu`** → `componentWillUpdate` (устаревшее)  
- **`cwun`** → `componentWillUnmount` (перед размонтированием)  
- **`gds`** → `getDerivedStateFromProps`  
- **`gsbu`** → `getSnapshotBeforeUpdate`  
- **`scu`** → `shouldComponentUpdate` (оптимизация рендеринга)  

### 🎣 **React Hooks**  
- **`ucb`** → `useCallback` (мемоизация функций)  
- **`uef`** → `useEffect` (сайд-эффекты)  
- **`usf`** → `useState` (состояние в функциональных компонентах)  
- **`imrs`** → Импорт `useState`  
- **`imrse`** → Импорт `useState` и `useEffect`  

### 🛠 **Вспомогательные сниппеты**  
- **`cp`** → Провайдер контекста (`Context.Provider`)  
- **`cpf`** → Метод класса (стрелочная функция)  
- **`hoc`** → Higher-Order Component (HOC)  
- **`rprop`** → Render Prop  
- **`ss`** → `setState`  
- **`ssf`** → Функциональный `setState`  
- **`ren`** → `render` (метод рендеринга)  

### 📦 **Импорты**  
- **`imr`** → Импорт React  
- **`imrc`** → Импорт React + `Component`  
- **`impc`** → Импорт React + `PureComponent`  
- **`imrd`** → Импорт ReactDOM  
- **`impt`** → Импорт PropTypes  

---

## 🔹 React TypeScript  

### 🏗 **Компоненты**  
- **`tsrcc`** → Каркас компонента-класса  
- **`tsrcfull`** → Компонент-класс с `Props`, `State` и конструктором  
- **`tsrcjc`** → Компонент-класс без импортов и `export default`  
- **`tsrpcc`** → Чистый компонент (`PureComponent`)  
- **`tsrpcjc`** → Чистый компонент без импортов и `export default`  
- **`tsrpfc`** → Чистый функциональный компонент  
- **`tsdrpfc`** → Функциональный компонент без состояния (с `export default`)  
- **`tsrsfc`** → Функциональный компонент без состояния  

### ⚙ **Методы жизненного цикла**  
- **`cwm`** → `componentWillMount`  
- **`ren`** → `render`  
- **`cdm`** → `componentDidMount`  
- **`cwrp`** → `componentWillReceiveProps`  
- **`scu`** → `shouldComponentUpdate`  
- **`cwu`** → `componentWillUpdate`  
- **`cdu`** → `componentDidUpdate`  
- **`cwum`** → `componentWillUnmount`  
- **`gdsfp`** → `getDerivedStateFromProps`  
- **`gsbu`** → `getSnapshotBeforeUpdate`  

### 🛠 **Вспомогательные методы**  
- **`conc`** → Конструктор с `props` и `context`  
- **`sst`** → `this.setState` с объектом  
- **`bnd`** → Привязка `this` метода в конструкторе  
- **`met`** → Простой метод класса  

### 🔌 **Redux & Импорты**  
- **`tscntr`** → Каркас Redux-контейнера  
- **`imt`** → Создать импорт  
