function appendValue(currentInput, currentOutput, value) {
    if (currentInput === "0" && value !== ".") {
        currentInput = value;
    } else {
        currentInput += value;
    }

    // Показываем пользователю × и ÷, но сохраняем * и /
    let displayValue = value;
    if (value === "*") displayValue = "×";
    if (value === "/") displayValue = "÷";

    currentOutput = currentInput;
    return { inputText: currentInput, outputText: currentOutput };
}

// Функция для очистки
function clearAll() {
    return { inputText: "0", outputText: "" };
}

// Функция для вычисления результата
function calculateResult(currentOutput) {
    try {
        // Заменяем × на * и ÷ на /
        let expression = currentOutput.replace(/×/g, "*").replace(/÷/g, "/");
        return { inputText: eval(expression).toString(), outputText: "" };
    } catch (e) {
        return { inputText: "Ошибка", outputText: "" };
    }
}

// Функция для изменения знака
function toggleSign(currentInput, currentOutput) {
    if (currentInput[0] === "-") {
        currentInput = currentInput.slice(1);
    } else {
        currentInput = "-" + currentInput;
    }
    return { inputText: currentInput, outputText: currentOutput };
}

// Функция для чередования скобок
function toggleParentheses(currentInput, currentOutput) {
    if (currentInput.indexOf("(") === -1 && currentInput.indexOf(")") === -1) {
        currentInput = "(" + currentInput;
    } else if (currentInput.indexOf(")") === -1) {
        currentInput = currentInput + ")";
    } else {
        currentInput = currentInput.replace(")", "");
    }
    return { inputText: currentInput, outputText: currentOutput };
}
