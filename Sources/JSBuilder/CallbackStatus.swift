#if !os(WASI)

/// Predefined callback status string constants
public enum CallbackStatus {
    public static let ready: String = "ready"
    public static let error: String = "error"
    public static let success: String = "success"
    public static let progress: String = "progress"
}

#endif
