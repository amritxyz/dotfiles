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
		<edit name="embeddedbitmap" mode="assign"><bool>false</bool></edit>
	</match>

	<!-- Default families -->
	<alias binding="same">
		<family>sans-serif</family>
		<prefer>
			<family>IBM Plex Sans</family>
			<family>Noto Sans</family>
		</prefer>
	</alias>
	<alias binding="same">
		<family>serif</family>
		<prefer>
			<family>IBM Plex Serif</family>
			<family>Noto Serif</family>
		</prefer>
	</alias>
	<alias binding="same">
		<family>monospace</family>
		<prefer>
			<family>IBM Plex Mono</family>
			<family>Noto Sans Mono</family>
		</prefer>
	</alias>

	<!-- Metric-compatible substitutes for common web/Office fonts -->
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
	<alias binding="same">
		<family>Times New Roman</family>
		<prefer>
			<family>Liberation Serif</family>
		</prefer>
	</alias>
	<alias binding="same">
		<family>Courier New</family>
		<prefer>
			<family>Liberation Mono</family>
		</prefer>
	</alias>

</fontconfig>
