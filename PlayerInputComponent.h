#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "PlayerInputComponent.generated.h"

UCLASS(ClassGroup=(Custom), meta=(BlueprintSpawnableComponent))
class UNREALGAME_API UPlayerInputComponent : public UActorComponent
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

	// Function to handle input for moving forward/backward
	UFUNCTION(BlueprintCallable)
	void MoveForward(float Value);

	// Function to handle input for turning left/right
	UFUNCTION(BlueprintCallable)
	void Turn(float Value);

	// Function to handle input for moving right/left
	UFUNCTION(BlueprintCallable)
	void MoveRight(float Value);

	// Function to handle input for looking up/down
	UFUNCTION(BlueprintCallable)
	void LookUp(float Value);
};