#finds files on a share, just fill in your information

$share = #change the path to remote share example: '\\COMPUTER_or_SERVER_NAME\FOLDER_NAME\'
$filename = #the name of the file you are looking for
get-childitem -recurse $share -include $filename
