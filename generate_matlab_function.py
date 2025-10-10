import random
import string
import os

# Define the MATLAB function content
matlab_function_code = '''function avg = calculateMean(vec)
% CALCULATEMEAN Computes the mean of a vector
%   AVG = CALCULATEMEAN(VEC) returns the mean value of the input vector VEC.

    if isempty(vec)
        avg = NaN; % Return NaN if the input vector is empty
        return;
    end

    avg = sum(vec) / length(vec);

end
'''

# Generate a random filename with a .m extension
random_name = "func_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".m"

# Write the function code to the file
with open(random_name, 'w') as f:
    f.write(matlab_function_code)

print(f"MATLAB function saved to {random_name}")