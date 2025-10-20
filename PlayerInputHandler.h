#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class UNREALINPUT_API APlayerInputHandler : public APlayerController
{
	GENERATED_BODY()

public:
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupInputComponent() override;

	// Movement functions
	void MoveForward(float Value);
	void MoveRight(float Value);

	// Look functions
	void LookUp(float Value);
	void Turn(float Value);

	// Action functions
	void Jump();
	void Shoot();

private:
	// Input mapping context reference
	class UInputMappingContext* DefaultMappingContext;

	// Input action references
	class UInputAction* MoveForwardAction;
	class UInputAction* MoveRightAction;
	class UInputAction* LookUpAction;
	class UInputAction* TurnAction;
	class UInputAction* JumpAction;
	class UInputAction* ShootAction;
};