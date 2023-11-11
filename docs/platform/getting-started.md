# Getting started with the Platform

These pages will guide you through the main features and actions you can do on the QCentroid Platform.

## Concepts

First, this is the list of concepts commonly used across the platform:

- **Problem**. The problem is the main entity of the platform. A problem represents a business Use Case that can be solved using an algorithm.
- **Solver**. A solver is an algorithm that solves a problem. You can have quantum and classical solvers. And you can run jobs with this solvers to execute them.
- **Repository**. A repository in the platform is a pointer to a Git repository where the actual code of the solver is stored.
- **Job**. A job is an execution of the solvers of a given problem. You can run all the solvers at once or select just one or just a few of them.
- **Executor**. For each solver executed in a job, an executor is run. When all the executors of a job have finished, the job itself also finishes and you could access the results.
- **Credit** is the billing unit in the platform. Each job execution has a cost in credits.
- **Hardware provider**. Solvers run in harware providers. These are usually Quantum Computing providers (QPU) but they can also be classical compunting providers or based on GPUs (Graphics Processing Unit) or TPUs (Tensor Processing Unit) for example.


## First steps

Now, what are you going to use the platform for?

**Are you a creator?** Yes, I want to create solvers for the existing problems or create my own problem and the solver.

:octicons-chevron-right-12: [I am a creator](getting-started-creators.md)

**Are you a consumer?** Yes, I want to run jobs to solve existing problems in my business sector.

:octicons-chevron-right-12: [I am a consumer](getting-started-consumers.md)

