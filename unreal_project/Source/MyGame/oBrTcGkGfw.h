// oBrTcGkGfw.h
// Player input handler class for Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "oBrTcGkGfw.generated.h"

// Player input handler class
UCLASS()
class MYGAME_API APlayerInputHandler : public APlayerController
{
    GENERATED_BODY()

public:
    // Constructor
    APlayerInputHandler();

    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

    // Called to bind functionality to input
    virtual void SetupInputComponent() override;

protected:
    // Input actions
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* JumpAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* MoveAction;

    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputAction* LookAction;

    // Input mapping context
    UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = "Input")
    class UInputMappingContext* DefaultMappingContext;

private:
    // Input callback functions
    void OnJumpActionStarted(const FInputActionValue& Value);
    void OnMoveAction(const FInputActionValue& Value);
    void OnLookAction(const FInputActionValue& Value);
};