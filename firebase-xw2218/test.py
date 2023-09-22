# --- Python Code to test XW2218

# --- Import XW2218
from xw2218 import *

# --- Test Include modules
#printEnvironment()

#client = login()

result = parse("94a4087f16c0-20221201-171857")

if result == None:
    print("Parse Failed")
    exit(0)

print("MAC", result[0]);
print("datatime", result[1]);
