# Changelog

## 0.3.0

### Additions

- Added support for domain-based robots.txt configuration using `CANONICAL_HOST` environment variable.
- Added ability to use original robots.txt for canonical domain while blocking others.

### Changes

- Made `BLOCK_ROBOTS` and `CANONICAL_HOST` environment variables mutually exclusive.
- Updated README with new configuration options and examples.

## 0.2.0

### Additions

- Initial release of the norobots gem, providing middleware for handling robots.txt in Rack applications. 
- Added middleware for blocking robots based on environment variable.
- Setup initial project structure and configuration.
- Added license to the gemspec.
- Created LICENSE file.
- Updated README with initial documentation.