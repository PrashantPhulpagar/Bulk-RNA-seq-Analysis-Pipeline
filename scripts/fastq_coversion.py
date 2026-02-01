import subprocess
import time

sra_numbers = [
    "SRR7179504", "SRR7179505", "SRR7179506", "SRR7179507",
    "SRR7179508", "SRR7179509", "SRR7179510", "SRR7179511",
    "SRR7179520", "SRR7179521", "SRR7179522", "SRR7179523",
    "SRR7179524", "SRR7179525", "SRR7179526", "SRR7179527",
    "SRR7179536", "SRR7179537", "SRR7179540","SRR7179541"
]

for sra_id in sra_numbers:
    print(f"\n=== Converting {sra_id} to FASTQ ===")

    cmd = f"fasterq-dump {sra_id} -O fastq --split-files"
    start = time.time()
    subprocess.call(cmd, shell=True)
    end = time.time()

    print(f"⏱ Time: {(end-start)/60:.2f} minutes")