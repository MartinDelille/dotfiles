const showNotification = (title, message = "") => {
  // Check if running in tmux
  const inTmux = process.env.TMUX !== undefined;

  if (inTmux) {
    // Tmux passthrough format
    process.stdout.write(
      `\x1bPtmux;\x1b\x1b]777;notify;${title};${message}\x1b\x1b\\\x1b\\`,
    );
  } else {
    // Direct terminal escape sequence
    process.stdout.write(`\x1b]777;notify;${title};${message}\x1b\\`);
  }
};

export const NotificationPlugin = async ({
  project,
  client,
  $,
  directory,
  worktree,
}) => {
  return {
    event: async ({ event }) => {
      // Send notification on session completion
      if (event.type === "session.idle") {
        const folderName = directory.split("/").pop() || "Unknown";
        showNotification("OpenCode", `Session Idle [${folderName}]`);
      }
      // Handle permission events (need for interaction)
      if (event.type === "permission.updated") {
        const permission = event.properties;
        showNotification(
          "OpenCode",
          `Permission needed for ${permission.title}`,
        );
      }
    },
  };
};
