use std::process::{Command, Stdio};

fn main() {
    #[cfg(target_os = "macos")]
    match run_install_mac() {
        Ok(_) => println!("Successfully installed on mac"),
        Err(e) => println!("Installation failed: {}", e)
    }
}

#[cfg(target_os = "macos")]
fn run_install_mac() -> Result<(), String> {
    let _ = check_brew_installed()
        .or_else(|_| install_brew());
    Ok(())
}

#[cfg(target_os = "macos")]
fn check_brew_installed() -> Result<(), String> {
    match Command::new("brew")
        .arg("--version")
        .stdout(Stdio::inherit())
        .stderr(Stdio::inherit())
        .output() {
        Ok(_) => Ok(()),
        Err(_) => Err("Failed to install NeoVim".to_string())
    }
}


#[cfg(target_os = "macos")]
fn install_brew() -> Result<(), String> {
    let install_script = "/bin/bash";
    let script_arg = "-c";
    let brew_install_command = "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

    let status = Command::new(install_script)
        .arg(script_arg)
        .arg(brew_install_command)
        .stdout(Stdio::inherit())
        .stderr(Stdio::inherit())
        .status();

    match status {
        Ok(exit_status) if exit_status.success() => Ok(()),
        Ok(_) | Err(_) => Err("Failed to install Homebrew".to_string()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn it_checks_for_brew() {
        assert!(check_brew_installed().is_ok());
    }
}
