// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "InputActionValue.h"
#include "PlayerInputComponent.generated.h"

class ACharacter;
class UInputMappingContext;
class UInputAction;

UCLASS(ClassGroup=(Custom), meta=(BlueprintSpawnableComponent))
class APIEXAMPLE_API UPlayerInputComponent : public UActorComponent
{
	GENERATED_BODY()

public:
	// Sets default values for this component's properties
	UPlayerInputComponent();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

	// Function to bind input actions, call this after spawning the character
	void SetupInputComponent(ACharacter* PlayerCharacter);

	// Input mapping context and actions, assign these in the editor or constructor
	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	UInputMappingContext* InputMappingContext;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	UInputAction* MoveAction;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	UInputAction* LookAction;

	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	UInputAction* JumpAction;

private:
	// Input callback functions
	void Move(ACharacter* PlayerCharacter, const FInputActionValue& Value);
	void Look(ACharacter* PlayerCharacter, const FInputActionValue& Value);
	void Jump(ACharacter* PlayerCharacter, const FInputActionValue& Value);
	void StopJump(ACharacter* PlayerCharacter, const FInputActionValue& Value);
};