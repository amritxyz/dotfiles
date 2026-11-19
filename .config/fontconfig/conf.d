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

	<!-- Arial / Helvetica -> Liberation Sans, Arimo -->
	<alias binding="same">
		<family>Arial</family>
		<prefer>
			<family>Liberation Sans</family>
			<family>Arimo</family>
		</prefer>
	</alias>
	<alias binding="same">
		<family>Helvetica</family>
		<prefer>
			<family>Liberation Sans</family>
			<family>Arimo</family>
		</prefer>
	</alias>

	<!-- Times New Roman -> Liberation Serif, Tinos -->
	<alias binding="same">
		<family>Times New Roman</family>
		<prefer>
			<family>Liberation Serif</family>
			<family>Tinos</family>
		</prefer>
	</alias>

	<!-- Courier New -> Liberation Mono, Cousine -->
	<alias binding="same">
		<family>Courier New</family>
		<prefer>
			<family>Liberation Mono</family>
			<family>Cousine</family>
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

	<!-- Georgia -> Noto Serif (no official-repo) -->
	<alias binding="same">
		<family>Georgia</family>
		<prefer>
			<family>Noto Serif</family>
		</prefer>
	</alias>

	<!-- Defaults -->
	<alias>
		<family>monospace</family>
		<prefer>
			<family>Hack</family>
			<family>Noto Color Emoji</family>
		</prefer>
	</alias>
	<alias>
		<family>sans-serif</family>
		<prefer>
			<family>Inter</family>
			<family>Noto Sans</family>
			<family>Noto Color Emoji</family>
		</prefer>
	</alias>
	<alias>
		<family>serif</family>
		<prefer>
			<family>Noto Serif</family>
			<family>Noto Color Emoji</family>
		</prefer>
	</alias>

</fontconfig>
