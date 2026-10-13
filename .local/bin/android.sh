#!/bin/sh

set -eu

# project name
if [ $# -gt 0 ]; then
	n="$1"
else
	i=000

	while [ -d "${i}-project" ]; do
		i=$(printf "%03d" $((10#$i + 1)))
	done

	n="${i}-project"
fi

# configuration
PACKAGE="com.example.myapp"
PACKAGE_PATH="com/example/myapp"

COMPILE_SDK=36
MIN_SDK=29
TARGET_SDK=36

# directories
mkdir -p \
	"$n/app/src/main/java/$PACKAGE_PATH" \
	"$n/app/src/main/res/layout" \
	"$n/app/src/main/res/values"

# settings.gradle
cat > "$n/settings.gradle" << 'EOF'
pluginManagement {
	repositories {
		google()
		mavenCentral()
		gradlePluginPortal()
	}
}

dependencyResolutionManagement {
	repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)

	repositories {
		google()
		mavenCentral()
	}
}

rootProject.name = "MyAndroidApp"

include(":app")
EOF

# root build.gradle
cat > "$n/build.gradle" << 'EOF'
plugins {
	id 'com.android.application' version '9.0.0' apply false
}
EOF

# gradle.properties
cat > "$n/gradle.properties" << 'EOF'
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
EOF

# app/build.gradle
cat > "$n/app/build.gradle" << EOF
plugins {
	id 'com.android.application'
}

android {
	namespace '$PACKAGE'
	compileSdk $COMPILE_SDK

	defaultConfig {
		applicationId '$PACKAGE'

		minSdk $MIN_SDK
		targetSdk $TARGET_SDK

		versionCode 1
		versionName '1.0'
	}
}
EOF

# androidManifest.xml
cat > "$n/app/src/main/AndroidManifest.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>

<manifest xmlns:android="http://schemas.android.com/apk/res/android">

	<application
		android:theme="@style/AppTheme"
		android:label="@string/app_name"
		android:allowBackup="true"
		android:supportsRtl="true">

		<activity
			android:name=".MainActivity"
			android:exported="true">

			<intent-filter>
				<action android:name="android.intent.action.MAIN" />
				<category android:name="android.intent.category.LAUNCHER" />
			</intent-filter>

		</activity>

	</application>

</manifest>
EOF

# mainActivity.java
cat > "$n/app/src/main/java/$PACKAGE_PATH/MainActivity.java" << 'EOF'
package com.example.myapp;

import android.app.Activity;
import android.os.Bundle;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		setContentView(R.layout.activity_main);
	}
}
EOF

# activity_main.xml
cat > "$n/app/src/main/res/layout/activity_main.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>

<LinearLayout
	xmlns:android="http://schemas.android.com/apk/res/android"
	android:layout_width="match_parent"
	android:layout_height="match_parent"
	android:gravity="center"
	android:orientation="vertical">

	<TextView
		android:layout_width="wrap_content"
		android:layout_height="wrap_content"
		android:text="@string/hello"
		android:textSize="24sp" />

</LinearLayout>
EOF

# themes.xml
cat > "$n/app/src/main/res/values/themes.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>

<resources>

	<style
		name="AppTheme"
		parent="android:style/Theme.Material.Light.NoActionBar">

		<item name="android:fontFamily">sans</item>

	</style>

</resources>
EOF

# strings.xml
cat > "$n/app/src/main/res/values/strings.xml" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>

<resources>
	<string name="app_name">My Android App</string>
	<string name="hello">Hello Android!</string>
</resources>
EOF

# .gitignore
cat > "$n/.gitignore" << 'EOF'
.gradle/
build/
app/build/
*.apk
*.aab
local.properties
.idea/
EOF

# makefile
cat > "$n/Makefile" << 'EOF'
GRADLE = gradle
APK = app/build/outputs/apk/debug/app-debug.apk
PACKAGE = com.example.myapp
ACTIVITY = .MainActivity

.PHONY: all build install run clean

all: build

build:
	$(GRADLE) assembleDebug

install: build
	adb install -r $(APK)

run: install
	adb shell am start -n $(PACKAGE)/$(ACTIVITY)

clean:
	$(GRADLE) clean
EOF

echo "Project '$n' ready."
echo
echo "Build:"
echo "  cd $n"
echo "  make"
echo
echo "Install:"
echo "  make install"
echo
echo "Run on phone:"
echo "  make run"
