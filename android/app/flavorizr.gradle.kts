import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("QWYSFlavor")

    productFlavors {
        create("dev") {
            dimension = "QWYSFlavor"
            applicationId = "ru.qwys.dev"
            resValue(type = "string", name = "app_name", value = "QWYS DEV")
        }
        create("prod") {
            dimension = "QWYSFlavor"
            applicationId = "ru.qwys"
            resValue(type = "string", name = "app_name", value = "QWYS")
        }
    }

    buildFeatures.resValues = true
}