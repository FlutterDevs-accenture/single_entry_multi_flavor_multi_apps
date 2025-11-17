plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.jci.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.jci.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
        debug {
            applicationIdSuffix = ".debug"
            versionNameSuffix = "-debug"
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "app"

    // 2️⃣ Define flavors and assign dimension
    productFlavors {
        create("jci") {
            dimension = "app" // ⚠️ must match flavorDimensions
            applicationId = "com.example.jci"
            resValue("string", "applicationName", "JCI App")
            manifestPlaceholders.put("appName", "JCI App")
        }
        create("accenture") {
            dimension = "app" // ⚠️ must match flavorDimensions
            applicationId = "com.example.accenture"
            resValue("string", "applicationName", "Accenture App")
            manifestPlaceholders.put("appName", "Accenture App")
        }
    }

}

flutter {
    source = "../.."
}
