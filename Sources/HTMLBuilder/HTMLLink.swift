#if !os(WASI)

public enum HTMLLink {

	public enum Relationship: String {

		case canonical = "canonical"
		case dnsPrefetch = "dns-prefetch"
		case preconnect = "preconnect"
		case preload = "preload"
		case stylesheet = "stylesheet"
		case icon = "icon"
		case appleTouchIcon = "apple-touch-icon"
		case manifest = "manifest"
		case alternate = "alternate"
		case noopener = "noopener"
		case noreferrer = "noreferrer"
	}

	public enum CrossOrigin: String {

		case anonymous = "anonymous"
		case useCredentials = "use-credentials"
	}

	public enum As: String {

		case audio = "audio"
		case document = "document"
		case embed = "embed"
		case fetch = "fetch"
		case font = "font"
		case image = "image"
		case object = "object"
		case script = "script"
		case style = "style"
		case track = "track"
		case video = "video"
		case worker = "worker"
	}
}

#endif
