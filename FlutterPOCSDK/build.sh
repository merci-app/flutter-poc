# Script to build SDK
# It is used in connection with Github Actions workflow
# More details at https://docktech.atlassian.net/l/cp/01a9idPt

buildFramework() {
    scheme=$1
    archiveName=$2

    xcodebuild archive \
    -scheme $scheme \
    -archivePath "archives/${archiveName}-iOS.xcarchive" \
    -destination="iOS" \
    -sdk iphoneos \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    BUILD_LIBRARIES_FOR_DISTRIBUTION=YES \
    clean build

    xcodebuild archive \
    -scheme $scheme \
    -archivePath "archives/${archiveName}-iOS-simulator.xcarchive" \
    -destination="iOS Simulator" \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    BUILD_LIBRARIES_FOR_DISTRIBUTION=YES \
    clean build

    xcodebuild -create-xcframework \
    -framework "archives/${archiveName}-iOS.xcarchive/Products/Library/Frameworks/${archiveName}.framework" \
    -framework "archives/${archiveName}-iOS-simulator.xcarchive/Products/Library/Frameworks/${archiveName}.framework" \
    -output "../${archiveName}.xcframework"
}

fixSwiftInterface() {
    NAMES=("MCISDKCheckoutCore" "MCISDKDigitalCheckout" "MCISDKFoundation" "MCISDKSDKKit" "MCISDKLogger" "MCISDKMarketpay" "MCISDKStorePayment" "MCISDKWithdrawal" "MarketPlaceKit" "MerciKit" "PayKit" "WithdrawalKit")
    for NAME in ${NAMES[@]}
    do
        find . -name "*.swiftinterface" -exec sed -i -e "s/${NAME}\.//g" {} \;
    done
}

buildFramework FlutterPOCSDK FlutterPOCSDK
