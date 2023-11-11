# How to add a solver

## Introduction

In this article we will go through the process of adding a new Solver to the QCentroid Platform.

This process involves **four main steps**:

1. Choose the problem
1. Implement the solver using the Solver Template and store it in a GitHub repository
1. Connect your repoisitory to the platform
1. Add the solver to the platform


## 1. Choose the problem

The first step is to choose the problem to be solved.

In the Problems section you can find all the problems available on the platform.

For this tutorial we will assume that we want to solve the **QRNG** (Quantum Random Number Generation) problem (our *hello world* quantum problem!).

## 2. Implement the solver using the Solver Template

Once the problem has been choosen, let’s see how we could create a solver associated to this problem in order to upload it to the QCentroid platform.

The easiest way to program your solvers is using **Python**.

First, we must prepare a GitHub repository with the following files:

- `solver-name.md` (solver documentation file)
- `main.py`
- `app.py`
- `requirements.txt`

### solver-name.md (solver documentation file)

You must include in the root of the repository a `[solver-name].md` file that will contain the documentation you want to include about your solver, explaining, if any, the parameters that can be inserted by the end user.

Continuing with our example, we would have created `MyFirstSolver.md`:

```md title="MyFirstSolver.md"
## MyFirstSolver
Test documentation associated with my solver.
I don't have auxiliary parameters but I could define them like this:
- "parameter1": (int) This is what my first parameter does.
```

### main.py

This file will contain only a `run` function to which the parameters `input_data`, `solver_params` and `extra_arguments` will be passed:

```py title="main.py"
from qiskit import QuantumCircuit, Aer, execute, IBMQ

def run(input_data, solver_params, extra_arguments):

    # This is your solver's code

    size = int(input_data['size'])
    backend = Aer.get_backend('qasm_simulator')

    qc = QuantumCircuit(1)
    qc.h(0)
    qc.measure_all()

    job = execute(qc, backend=backend, shots=size, memory=True)
    individual_shots = job.result().get_memory()

    output = ''
    for i in individual_shots:
        output+=i

    # And this is the output it returns

    return output
```


### app.py

The purpose of this file is for local testing only. In the platform it will be replaced with the platform's own file that adds the necessary libraries and that calls the right hardward providers.

```py
import main
result = main.run(problem_data, solver_params, extra_arguments)
print(result)
```

!!! warning "Caution"

    You should not modify this file to ensure that your solver works in both local and production environments.

As you can see, from this file the only thing that will be done is to call the function **`run`** that we have just created in the `main.py` file.

In order to test that everything works correctly locally without having to upload it to the platform, this is the ideal place to do it.

For this, we must be clear about the JSON input that will receive your solver, something like this:


```JSON title="input.json"
{
    "data": {
        "size": 50
    },
    "solver_params":{
    },
    "extra_arguments": {
    }
}
```

with the corresponding “solver_params” and “extra_arguments” if any. Finally, we would only have to create an input.json like the file we have just shown and modify app.py as follows:

```py title="app.py"
input_file_name = "input.json"

# Input data loader. Container will get data from here

import json
with open(input_file_name) as f:
  dic = json.load(f)

# Optional extra parameters

if "extra_arguments" in dic:
    extra_arguments = dic['extra_arguments']
else:
    extra_arguments = {}

if "solver_params" in dic:
    solver_params = dic['solver_params']
else:
    solver_params = {}


import main
result = main.run(dic['data'], solver_params, extra_arguments)
print(result)
```

And when executing the `app.py` it will return, in this case, a string of 50 random zeros and ones (created with the qiskit simulator).

### requirements.txt

Finally we must create the `requirements.txt` file containing the libraries used in the solver along with their versions:

```txt title="requirements.txt"
qiskit==0.17.0
```

Any libraries from the standard approved ones in **pip** will be instaled. So make sure you add all your code dependencies.

When working locally, it is very useful to create a new environment (with VirtualEnv or Conda) to make sure you don’t have dependency mixes or you are not missing anything. Start with a completely new **Python3.8** environment and add all the required modules in your `requirements.txt` file.

## 3. Connect your GitHub repository to the platform

Now that you have your solver source code tracked in a repository, you can connect it to the Platform to make it accessible.

!!! warning "Important"

    Make sure to follow all the steps in this process, specially step 3.c, where you have to go to your repository in GitHub and add the Deploy Key provided by the Platform.

To connect a repository to the platform:

1. Go to the section **Repositories** through the left side menu
1. Then, on the top-right corner, click on the **Connect a new solver** button.
1. You will get the repository connection wizzard where you can do all the required steps:
    1. Fill the repository information: name and URL
    1. Generate an SSH key pair to **ensure the security of your code**
    1. **Go to your GitHub account**: *Your repository > Settings > Deploy keys* and add the generated key
1. Click the **Connect** button at the end of the wizzard to complete the process

Now you just have to wait until the process finishes.

You will see your new repository marked as ***Connected*** when this is done.


## 4. Add the solver to the platform

And now that you have connected your repository, you can add the solver to the Platform to start running jobs.

To add a new solver to the platform:

1. Go to the section **My solvers** through the left side menu
1. Then, on the top-right corner, click on the **Add new solver** button
1. You will get the solver creation wizzard where you can fill all the information of your solver:
    - Select the problem you are solving
    - Select the GitHub repository where the code is tracked
    - Fill in your solver details: name and description
1. Click the **Add solver** button at the end of the wizzard to save the solver.


## What's next

:octicons-chevron-right-12: [Execute your solver](launch-job-dashboard.md)

:octicons-chevron-right-12: [Edit or update this solver](edit-solver.md)

:octicons-chevron-right-12: [Get started with the API and SDK](../api/getting-started.md)