use clap::{Parser, Subcommand};

#[derive(Parser)]
#[command(name = "dag-gen")]
#[command(about = "DAG code generator CLI")]
struct Cli {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand)]
enum Commands {
    Generate {
        config: String,
        #[arg(long)]
        out: Option<String>,
    },
}

fn main() {
    let cli = Cli::parse();

    match cli.command {
        Commands::Generate { config, out } => {
            println!("Generating DAG from {}", config);

            if let Some(dir) = out {
                println!("Output directory: {}", dir);
            }
        }
    }
}
