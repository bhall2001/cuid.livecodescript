script "cuid"
constant BASE=36
constant BLOCK_SIZE=4
constant ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyz"

local sDiscreteValues
local sFingerprint
local sCount


on libraryStack
   # intialize counter
   put 0 into sCount
   
   # intialize descrete values
   put BASE ^ BLOCK_SIZE into sDiscreteValues
   
   # initialize fingerprint
   put _fingerprint() into sFingerprint
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


/**
generate a random block
**/
private function _randomBlock
   local tRandomNum
   
   put random(sDiscreteValues) into tRandomNum
   return format("%04s",baseConvert(tRandomNum, 10, 36))
end _randomBlock

/**
counter ensures same machine same time cuids don't collide
**/
private function _counter
   add 1 to sCount
   if sCount >= sDiscreteValues then
      put 0 into sCount
   end if
   
   return sCount
end _counter


command test._fingerprint
   local tFingerprint
   put _fingerprint() into tFingerprint
end test._fingerprint


command test._randomBlock
   local tBlock
   
   put _randomBlock() into tBlock
end test._randomBlock


