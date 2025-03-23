function appendValue(currentInput, currentOutput, value) {
    if (currentInput === "0" && value !== ".") {
        currentInput = value;
    } else {
        currentInput += value;
    }

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
        let expression = currentOutput.replace(/×/g, "*").replace(/÷/g, "/");
        let result = eval(expression);

        if (isNaN(result)) {
            throw new Error("Invalid expression");
        }

        return { inputText: result.toString(), outputText: result.toString() };
    } catch (e) {
        console.error("Ошибка в вычислениях: ", e);
        return { inputText: "Ошибка", outputText: "Ошибка" };
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

