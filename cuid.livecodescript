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
   
   put processID() into tPID
   put hostName() into tHostname
   put format("%04s",baseConvert(tPid, 10, 36)) into tPaddedPID
   
   put 36 + length(tHostName) into tHostnameHash
   
   repeat for each char tChar in tHostName
      add nativeCharToNum(tChar) to tHostnameHash
   end repeat
   
   put format("%04s",baseConvert(tHostnameHash, 10, 36)) into tPaddedHostname
   
   return tPaddedPID & tPaddedHostname
end _fingerprint


command test._fingerprint
   local tFingerprint
   put _fingerprint() into tFingerprint
end test._fingerprint



