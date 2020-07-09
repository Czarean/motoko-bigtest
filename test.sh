echo PATH = $PATH
echo vessel @ `which vessel`

echo
echo == Build.
echo

dfx start --background
dfx canister create --all
dfx build

echo
echo == Start BigMap service.
echo

dfx canister install BigMap

echo
echo == Test BigMap service.
echo

dfx canister install BigMapPutGet
LOOP="(true)";
while [ "$LOOP" == "(true)" ]; do
    LOOP=$(dfx canister call BigMapPutGet doNextCall)
done