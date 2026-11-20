<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>

	<!-- Rendering -->
	<match target="font">
		<edit name="antialias" mode="assign"><bool>true</bool></edit>
		<edit name="hinting" mode="assign"><bool>true</bool></edit>
		<edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
		<edit name="autohint" mode="assign"><bool>false</bool></edit>
		<edit name="rgba" mode="assign"><const>rgb</const></edit>
		<edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit>
		<edit name="embeddedbitmap" mode="assign"><bool>true</bool></edit>
	</match>

	<match target="pattern">
		<edit name="family" mode="append" binding="weak">
			<string>Noto Color Emoji</string>
		</edit>
	</match>

	<!-- Metric-compatible families -->

	<!-- Arial / Helvetica -> Liberation Sans -->
	<alias binding="same">
		<family>Arial</family>
		<prefer>
			<family>Liberation Sans</family>
		</prefer>
	</alias>
	<alias binding="same">
		<family>Helvetica</family>
		<prefer>
			<family>Liberation Sans</family>
		</prefer>
	</alias>

	<!-- Times New Roman -> Liberation Serif -->
	<alias binding="same">
		<family>Times New Roman</family>
		<prefer>
			<family>Liberation Serif</family>
		</prefer>
	</alias>

	<!-- Courier New -> Liberation Mono -->
	<alias binding="same">
		<family>Courier New</family>
		<prefer>
			<family>Liberation Mono</family>
		</prefer>
	</alias>

	<!-- Calibri -> Carlito, Cambria -> Caladea -->
	<alias binding="same">
		<family>Calibri</family>
		<prefer>
			<family>Carlito</family>
		</prefer>
	</alias>
	<alias binding="same">
		<family>Cambria</family>
		<prefer>
			<family>Caladea</family>
		</prefer>
	</alias>

	<!-- Georgia -> IBM Plex Serif (no official-repo) -->
	<alias binding="same">
		<family>Georgia</family>
		<prefer>
			<family>IBM Plex Serif</family>
		</prefer>
	</alias>

	<!-- Defaults -->
	<alias>
		<family>monospace</family>
		<prefer>
			<family>IBM Plex Mono</family>
			<family>Noto Color Emoji</family>
		</prefer>
	</alias>
	<alias>
		<family>sans-serif</family>
		<prefer>
			<family>Atkinson Hyperlegible</family>
			<family>Noto Color Emoji</family>
		</prefer>
	</alias>
	<alias>
		<family>serif</family>
		<prefer>
			<family>IBM Plex Serif</family>
			<family>Noto Color Emoji</family>
		</prefer>
	</alias>

</fontconfig>
