#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class UNREALINPUT_API APlayerInputHandler : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

	// Input binding functions
	void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

	// Movement functions
	void MoveForward(float Value);
	void MoveRight(float Value);

	// Look functions
	void LookUp(float Value);
	void Turn(float Value);

	// Action functions
	void JumpAction();
	void FireAction();

private:
	// Movement components
	UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Movement")
	class UInputComponent* InputComp;

	// Character movement component
	UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Movement")
	class UCharacterMovementComponent* MovementComp;
};