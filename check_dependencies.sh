print_info_message()
{
	echo "\n\n##############################"
	echo "	$1"
	echo "##############################\n\n"
}

print_error_message()
{
	echo "##############################"
	echo "	A COMMAND HAS FAILED --->"
	echo "			$1"
	echo "##############################"
}


print_success_message()
{
	echo "##############################"
	echo "	ALL REQUIRED SOFTWARE IS AVAILABLE"
	echo "##############################"
}

################################################################################
# CHECK FOR REQUIRED SOFTWARE
################################################################################

# Initially, no errors are found.
error=0

print_info_message "Checking for required software..."

#GNU Make
make --version
if [ $? -ne 0 ]; then
    print_error_message "make --version"
    echo "GNU Make is required to perform a complete build of 8-bit Hubble."
    error=1
fi

#GNU GCC
gcc --version
if [ $? -ne 0 ]; then
    print_error_message "gcc --version"
    echo "GNU GCC is required to perform a complete build of 8-bit Hubble"
    error=1
fi

#GNU GDB
gdb --version
if [ $? -ne 0 ]; then
    print_error_message "gdb --version"
    echo "GNU GDB is required to perform a complete build of 8-bit Hubble"
    error=1
fi

#GNU GPROF
gprof --version
if [ $? -ne 0 ]; then
    print_error_message "gprof --version"
    echo "GNU Gprof is required to perform a complete build of 8-bit Hubble"
    error=1
fi

#GNU GCOV
gcov --version
if [ $? -ne 0 ]; then
    print_error_message "gcov --version"
    echo "GNU Gcov is required to perform a complete build of 8-bit Hubble"
    error=1
fi

#Pkg-config
pkg-config --version
if [ $? -ne 0 ]; then
    print_error_message "pkg-config --version"
    echo "pkg-config is required to perform a complete build of 8-bit Hubble"
    error=1
fi

#LCOV
lcov --version
if [ $? -ne 0 ]; then
    print_error_message "lcov --version"
    echo "LCOV is required to perform a complete build of 8-bit Hubble"
    error=1
fi

#Flawfinder
flawfinder --version
if [ $? -ne 0 ]; then
    print_error_message "flawfinder --version"
    echo "Flawfinder is required to perform a complete build of 8-bit Hubble"
    error=1
fi

#Cppcheck
cppcheck --version
if [ $? -ne 0 ]; then
    print_error_message "cppcheck --version"
    echo "Cppcheck is required to perform a complete build of 8-bit Hubble"
    error=1
fi

#Python
python --version
if [ $? -ne 0 ]; then
    print_error_message "python --version"
    echo "Python 2.7 is required to perform a complete build of 8-bit Hubble"
    error=1
fi

print_info_message "Checking for required libraries..."

# LIBPNG
print_info_message "Checking for libPNG version 1.2.50 ..."
ldconfig -p | grep libpng12
if [ $? -ne 0 ]; then
    print_error_message "ldconfig -p | grep libpng12"
    echo "libPNG v1.2.50 not found in the system."
    echo "libPNG v1.2.50 is required in order to build all versions of 8-bit Hubble."
    error=1
fi

# LIBGTK
print_info_message "Checking for GTK version 3..."
ldconfig -p | grep libgtk-3
if [ $? -ne 0 ]; then
    print_error_message "ldconfig -p | grep libgtk-3"
    echo "GTK v3 not found in the system."
    echo "GTK v3 is required in order to build GUI versions of 8-bit Hubble."
    error=1
fi

if [ $error -ne 0 ]; then
    print_info_message "ONE OR MORE REQUIRED TOOLS COULD NOT BE FOUND.\n \
						8-Bit Hubble cannot be build."
    exit 1
fi
#################################################################################

print_success_message
