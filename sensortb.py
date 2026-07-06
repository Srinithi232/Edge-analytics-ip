import random

# Number of samples
NUM_SAMPLES = 100

with open("sensor_data.mem", "w") as f:

    temperature = 25

    for i in range(NUM_SAMPLES):

        # Simulate realistic temperature variation
        temperature += random.randint(-1, 2)

        # Keep within limits
        if temperature < 20:
            temperature = 20
        if temperature > 50:
            temperature = 50

        # Write hexadecimal value (16-bit)
        f.write(f"{temperature:04X}\n")

print("sensor_data.mem created successfully!")