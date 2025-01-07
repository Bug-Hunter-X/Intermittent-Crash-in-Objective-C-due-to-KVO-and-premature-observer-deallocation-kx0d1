# Objective-C KVO Crash Bug Report

This repository demonstrates a subtle bug related to Key-Value Observing (KVO) in Objective-C. The bug manifests as an intermittent crash caused by the deallocation of an observer before the observed object removes it from its observer list.

## Problem Description
The application crashes due to a `EXC_BAD_ACCESS` error. This usually happens when an object sends a message to a deallocated object.  The issue is triggered by the interplay between the timing of object deallocation and KVO notifications.

## Steps to Reproduce
1. Clone the repository.
2. Build and run the project.  The crash might not happen on every run, depending on the thread scheduling.

## Solution
The solution involves ensuring that the observer is always removed before it's deallocated.  This can be achieved by removing the observer in the `dealloc` method of the observer class, or by using a `@weakify` and `@strongify` block for better management of weak references.  The implementation for the solution is in `KVOSolution.m`.