extends RigidBody2D

# Reference to Level
var gravity_manager

# Speed of movement (pixels/sec)
const SPEED = 500
# Tile size for optional grid offset
const TILE_SIZE = 64

func _ready() -> void:
	gravity_manager = get_parent().get_parent()
	lock_rotation = true  # prevents spinning

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	# Get current gravity direction
	var g = gravity_manager.gravity_direction

	# Calculate desired velocity along gravity axis
	var desired_velocity = g * SPEED

	# Lock perpendicular axis by preserving current position in that axis
	# Example: if moving left/right, keep vertical velocity zero
	if g.x != 0:
		desired_velocity.y = 0
	else:
		desired_velocity.x = 0

	# Apply velocity via PhysicsDirectBodyState2D
	state.linear_velocity = desired_velocity

	# Optional: snap perpendicular axis to tile grid (offset center)
	if g.x != 0:
		state.transform.origin.y = round((state.transform.origin.y - TILE_SIZE/2) / TILE_SIZE) * TILE_SIZE + TILE_SIZE/2
	else:
		state.transform.origin.x = round((state.transform.origin.x - TILE_SIZE/2) / TILE_SIZE) * TILE_SIZE + TILE_SIZE/2
