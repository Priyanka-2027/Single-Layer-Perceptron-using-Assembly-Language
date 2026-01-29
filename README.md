# Single-Layer Perceptron in x86 Assembly Language

A 16-bit assembly implementation of a single-layer perceptron with step activation function, written in x86 assembly language.

## Overview

This program implements a single-layer perceptron that:
- Takes 3 input values (x1, x2, x3)
- Applies 3 corresponding weights (W1, W2, W3)
- Adds a bias term
- Uses a step activation function (output = 1 if weighted sum ≥ 0, else 0)

## Mathematical Model

The single-layer perceptron computes:
```
y = step(x1*W1 + x2*W2 + x3*W3 + bias)
```

Where the step function is:
```
step(z) = 1 if z ≥ 0
step(z) = 0 if z < 0
```

## Program Features

- **Interactive Input**: Prompts user for all inputs and parameters
- **Input Validation**: Accepts single digits (0-9) for inputs and weights
- **Bias Support**: Supports both positive and negative bias values
- **Real-time Calculation**: Computes and displays output immediately
- **16-bit DOS Program**: Runs in DOS environment using BIOS interrupts

## Input Requirements

- **Inputs (x1, x2, x3)**: Single digits (0-9)
- **Weights (W1, W2, W3)**: Single digits (0-9)
- **Bias Sign**: Either '+' or '-'
- **Bias Value**: Single digit (0-9)

## How to Run

### Prerequisites
- **Recommended**: emu8086 emulator (includes assembler and emulator)
- Alternative: MASM assembler with DOS environment or DOSBox
- Or any x86 assembler that supports MASM syntax

### Compilation and Execution

#### Using emu8086 (Recommended):
1. Open emu8086 emulator
2. Copy and paste the assembly code into the editor
3. Click "Compile" (F5) to assemble the program
4. Click "Emulate" to run in the built-in emulator
5. The program will run in the emulator window with full input/output support


## Example Usage

```
Enter x1 (0-9): 4
Enter x2 (0-9): 2
Enter x3 (0-9): 7
Enter W1 (0-9): 4
Enter W2 (0-9): 2
Enter W3 (0-9): 7
Enter Bias sign (+ or -): -
Enter Bias value (0-9): 1
Output y = 1
```

**Calculation**: y = step(4×4 + 2×2 + 7×7 - 1) = step(16 + 4 + 49 - 1) = step(68) = 1

## Code Structure

### Data Segment
- Input prompts for all parameters
- Storage arrays for inputs (X) and weights (W)
- Variables for bias (B) and output (Y)

### Main Procedure
1. Initialize data segment
2. Read all input values
3. Compute neural network output
4. Display result
5. Exit program

### Helper Procedures
- `READ_DIGIT`: Reads single digit input (0-9)
- `READ_SIGN`: Reads bias sign (+ or -)
- `COMPUTE_OUTPUT`: Calculates weighted sum and applies step function

## Technical Details

- **Architecture**: 16-bit x86
- **Memory Model**: Small model
- **Stack Size**: 256 bytes
- **System Calls**: DOS interrupts (INT 21h)
- **Input Method**: BIOS keyboard interrupts
- **Output Method**: DOS screen output

## Limitations

- Single-digit inputs only (0-9)
- No input validation for non-numeric characters
- Fixed network architecture (3 inputs, 3 weights)
- No support for floating-point numbers
- Requires DOS environment to run

## Educational Value

This project demonstrates:
- Basic neural network concepts
- Low-level programming in assembly
- System programming with BIOS/DOS interrupts
- Memory management and data structures
- Mathematical operations in assembly

## Future Enhancements

- Support for multi-digit inputs
- Floating-point arithmetic
- Multiple layers/deeper networks
- Different activation functions (sigmoid, ReLU)
- Batch processing capabilities
- GUI interface
- Training algorithm implementation

  ## Output Screenshots

<img width="531" height="217" alt="image" src="https://github.com/user-attachments/assets/791a52d2-d8ae-4bf6-aacd-63fe3b5fad4a" />
<img width="729" height="361" alt="image" src="https://github.com/user-attachments/assets/ebb8eca7-44f4-4cbc-8e1f-26651bc626b9" />


