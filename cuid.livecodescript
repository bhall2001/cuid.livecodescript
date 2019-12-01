script "cuid"
constant BASE=36
constant BLOCK_SIZE=4
constant ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyz"

local sDISCRETE_VALUES
local sFINGERPRINT


on libraryStack
   put BASE ^ BLOCK_SIZE into sDISCRETE_VALUES
end libraryStack


/**
create a unique fingerprint from process id and hostname
**/

private function _fingerprint
   local tPID
   local tHostname
   local tHostnameHash
   local tPaddedPID
   local tPaddedHostname
   
end _fingerprint



