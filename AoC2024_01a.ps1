## https://adventofcode.com/2024/day/1

# Read the content of the file InputAoC_01a.txt

##$filePath = "InputAoC_01aTST.txt" 
$filePath = "InputAoC_01a.txt"
$fileContent = Get-Content -Path $filePath

# Initialize an empty array to hold the two-dimensional data
$twoDimensionalArray = @()

# Process each line and split into columns
foreach ($line in $fileContent) {
    $columns = $line -split '\s+'
    $twoDimensionalArray += ,@([int]$columns[0], [int]$columns[1])
}

# Sort each column in $twoDimensionalArray, lowest to highest

# Extract the first column and sort it
$firstColumn = $twoDimensionalArray | ForEach-Object { $_[0] } | Sort-Object

# Extract the second column and sort it
$secondColumn = $twoDimensionalArray | ForEach-Object { $_[1] } | Sort-Object

# Combine the sorted columns back into a two-dimensional array
$sortedTwoDimensionalArray = @()
for ($i = 0; $i -lt $firstColumn.Length; $i++) {
    $sortedTwoDimensionalArray += ,@($firstColumn[$i], $secondColumn[$i])
}

# Output the sorted two-dimensional array to the console
## $sortedTwoDimensionalArray

# Initialize a variable to hold the sum of the differences
$totalDifferenceSum = 0

# For each line in the sorted two-dimensional array, subtract the highest column value from the lowest column value and add the result to the total sum
foreach ($row in $sortedTwoDimensionalArray) {
    $maxValue = [math]::Max($row[0], $row[1])
    $minValue = [math]::Min($row[0], $row[1])
    $difference = $maxValue - $minValue
    $totalDifferenceSum += $difference
}

# Output the total sum of the differences to the console
$totalDifferenceSum

#### Should be 2580760