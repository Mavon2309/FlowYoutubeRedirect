# FlowYoutubeRedirect

FlowYoutubeRedirect is a Flow Launcher plugin for searching YouTube. Use the
`yt` action keyword to see video results inside Flow Launcher, open the search
on YouTube, or choose between both options.

## Usage

- `yt funny cats` — search using your selected default behavior.

The default behavior is **Show both options**, which displays matching videos
and an **Open search on YouTube** action. You can instead select **Flow Launcher
results only** or **YouTube only** in the plugin's Flow Launcher settings.

If results cannot be loaded because of a network or YouTube parsing error, the
plugin displays a fallback action that opens the same search on YouTube.

## Installation

Download `FlowYoutubeRedirect.zip` from the private
[GitHub releases page](https://github.com/Mavon2309/FlowYoutubeRedirect/releases),
then install that ZIP in Flow Launcher. GitHub login is required to access the
private repository.

## Releasing

Releases are packaged automatically by GitHub Actions. Update the version in
`plugin.json`, then run the **Build and release** workflow. The workflow creates
the matching version tag and publishes a Flow Launcher-ready ZIP.

## Credits and fork notice

FlowYoutubeRedirect is maintained by Viraj Kapur and is a fork of
[FlowYouTube](https://github.com/Garulf/FlowYouTube), originally created by
[Garulf](https://github.com/Garulf). The original project provided the core
YouTube search integration on which this fork is based.
