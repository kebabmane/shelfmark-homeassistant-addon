# Shelfmark

Shelfmark is a unified web interface for searching and downloading books and audiobooks from multiple sources.

## Features

- Search across multiple book and audiobook sources
- Unified download queue with real-time progress
- Support for torrents, Usenet, and IRC downloads via Prowlarr
- Works with Calibre-Web-Automated, Booklore, and Audiobookshelf

## Installation

1. Add this repository to your Home Assistant Add-on Store
2. Install the Shelfmark add-on
3. Configure your timezone in the add-on settings
4. Start the add-on
5. Access Shelfmark at `http://your-ha-ip:8084`

## Configuration

### Option: `timezone`

Set your local timezone for correct timestamps. Default is `Etc/UTC`.

Examples: `America/New_York`, `Europe/London`, `Asia/Tokyo`

### Option: `log_level`

Control the verbosity of logging. Options are:
- `debug` - Detailed debugging information
- `info` - General operational information (default)
- `warning` - Warning messages only
- `error` - Error messages only

## Data Storage

- **Configuration**: Stored in the add-on's persistent data directory
- **Downloads**: Saved to `/media/shelfmark` (accessible via Home Assistant's Media Browser)

## Optional Integrations

Shelfmark works standalone but can integrate with:

- **Prowlarr**: For additional torrent/Usenet indexer sources
- **Calibre-Web-Automated**: For automatic book library management
- **Audiobookshelf**: For audiobook library management

Configure these integrations within Shelfmark's web interface.

## Support

For issues and feature requests, visit the [Shelfmark GitHub repository](https://github.com/calibrain/shelfmark).
