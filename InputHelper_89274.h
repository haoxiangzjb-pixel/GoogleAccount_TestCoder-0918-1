#pragma once

#include "CoreMinimal.h"

// Helper function to normalize input values
float NormalizeInput(float RawInput, float DeadZoneThreshold);

// Helper function to check if input is active
bool IsInputActive(float InputValue, float Threshold);