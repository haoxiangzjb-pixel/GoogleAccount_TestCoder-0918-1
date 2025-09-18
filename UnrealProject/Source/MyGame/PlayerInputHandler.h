// PlayerInputHandler.h
#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * Class responsible for handling player input in the game.
 * Binds input actions to specific functions.
 */
UCLASS()
class MYGAME_API APlayerInputHandler : public APlayerController
{
	GENERATED_BODY()

public:
	// Constructor
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

	// Called to bind functionality to input
	virtual void SetupInputComponent() override;

private:
	// Input action handlers
	UFUNCTION()
	void HandleJump();

	UFUNCTION()
	void HandleMoveForward(float Value);

	UFUNCTION()
	void HandleMoveRight(float Value);

	UFUNCTION()
	void HandleFire();

	// State variables
	bool bIsJumping;
	bool bIsFiring;
};