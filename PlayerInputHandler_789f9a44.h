// PlayerInputHandler_789f9a44.h
// A Unreal Engine class for handling player input

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler_789f9a44.generated.h"

UCLASS()
class APlayerInputHandler : public ACharacter
{
    GENERATED_BODY()

public:
    // Sets default values for this character
    APlayerInputHandler();

    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called to bind functionality to input
    virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

protected:
    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

    // Movement functions
    UFUNCTION()
    void MoveForward(float Value);

    UFUNCTION()
    void MoveRight(float Value);

    // Rotation functions
    UFUNCTION()
    void Turn(float Rate);

    UFUNCTION()
    void LookUp(float Rate);

    // Action functions
    UFUNCTION()
    void Jump();

    UFUNCTION()
    void StopJumping();

    // Base turn rates for input sensitivity
    float BaseTurnRate = 45.0f;
    float BaseLookUpRate = 45.0f;
};