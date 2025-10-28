#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * APlayerInputHandler - Handles player input for Unreal Engine
 */
UCLASS()
class APlayerInputHandler : public APlayerController
{
    GENERATED_BODY()

public:
    APlayerInputHandler();

    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called to bind functionality to input
    virtual void SetupInputComponent() override;

    // Movement functions
    void MoveForward(float Value);
    void MoveRight(float Value);

    // Look functions
    void TurnAtRate(float Rate);
    void LookUpAtRate(float Rate);

    // Action functions
    void Jump();
    void Fire();

private:
    // Input mapping context
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputMappingContext* DefaultMappingContext;

    // Input action references
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* MoveForwardAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* MoveRightAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* JumpAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* FireAction;

    // Variables to store input values
    float CurrentForwardValue;
    float CurrentRightValue;
};