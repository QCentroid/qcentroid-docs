# Getting started with the Platform

These pages will guide you through the main features and actions you can do on the platform.

## Concepts

This is the list of concepts commonly used across the platform:

- **Problem**. The problem is the main entity of the platform. A problem represents a business Use Case, that can be solved using an algorithm.
- **Solver**. A solver is an algorithm that solves a problem. You can have quantum solvers, but also classical solvers.
- **Repository**. A repository in the platform is a pointer to a Git repository where the actual code of the solver is stored.
- **Job**. A job is an execution of the solvers of a problem. You can run all the solvers at once or select just one or just a few of them.
- **Executor**. For each solver executed in a job, an executor is run. When all the executors of a jub have finished, the job itself also finishes and you could access the results.
- **Credit**. A credit is the billing unit in the platform. Each job execution has a cost in credits. 


## Get access to the platform

You should be able to access the platform with your SSO account.

If you see an error message like this one:

![Login permission error](../images/login-permission-error.png)

Contact User Support to be granted access to the platform.

## First steps

To use the Quantum Platform, you will want to start at the ***Problems*** section.

This section shows all the Use Cases currently available on the platform.

## What's next

:octicons-chevron-right-12: [Navigate through the problems](browse-problems.md)

:octicons-chevron-right-12: [Get started with the API and SDK](../api/getting-started.md)
