## https://adventofcode.com/2024/day/1

# Read the content of the file InputAoC_01a.txt

##$filePath = "InputAoC_01aTST.txt" 
$filePath = "InputAoC_01a.txt"
$fileContent = Get-Content -Path $filePath

# Initialize an empty array to hold the two-dimensional data
$twoDimensionalArray = @()
$secondColumn = @()

# Process each line and split into columns
foreach ($line in $fileContent) {
    $columns = $line -split '\s+'
    $twoDimensionalArray += ,@([int]$columns[0], [int]$columns[1])
    $secondColumn += $columns[1]
}
    
# Initialize an array to hold the results with the third column
$resultArray = @()
    
# For each row in the two-dimensional array, count the number of times the first column value appears in the second column
foreach ($row in $twoDimensionalArray) {
    $firstColumnValue = $row[0]
    $countInSecondColumn = ($secondColumn | Where-Object { $_ -eq $firstColumnValue }).Count
    # write-host "Row: $firstColumnValue, Count: $countInSecondColumn"
    $resultArray += ,@($row[0], $row[1], $countInSecondColumn)
}

# foreach ($resultRow in $resultArray) {
#    if ($resultRow[2] -gt 0) {
#        # Write-Host "Row: $($resultRow[0]), $($resultRow[1]), Count: $($resultRow[2])"
#    }
#}

$totalProductSum = 0

# For each line in the result array, multiply the value in the first column with the value in the third column and add the result to the total sum
foreach ($row in $resultArray) {
    $product = $row[0] * $row[2]
    $totalProductSum += $product
    Write-Host "Product: $($row[0]) * $($row[2]) = $product     $totalProductSum"
}

# Output the total sum of the products to the console
$totalProductSum
