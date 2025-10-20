#include "InputHelper_89274.h"

// Helper function to normalize input values
float NormalizeInput(float RawInput, float DeadZoneThreshold)
{
    if (FMath::Abs(RawInput) < DeadZoneThreshold)
    {
        return 0.0f;
    }
    return FMath::Clamp(RawInput, -1.0f, 1.0f);
}

// Helper function to check if input is active
bool IsInputActive(float InputValue, float Threshold)
{
    return FMath::Abs(InputValue) > Threshold;
}