# Loe-Aipurge - Vehicle & Ped Suppression

**Loe-Aipurge** is a script for **FiveM QBCore servers** that removes specific vehicles and NPCs (peds) from the game world. This includes vehicles and personnel associated with EMS, police, and military. It helps keep the server environment clean and free of unwanted law enforcement or emergency vehicles and personnel.

---

## Features
- Suppresses and removes EMS, police, and military vehicles.
- Removes associated personnel, including police officers, firefighters, and military units.
- Clears law enforcement and emergency personnel within a 400m radius of the player.
- Customizable vehicle and ped blacklist for easy modification.
- Runs periodically to ensure suppressed vehicles/peds are cleaned up.

---

## Prerequisites
- A **FiveM Server** running.

---

## Installation

1. **Download and Add to Server Resources**  
   Save the entire `Loe-Aipurge` folder into your server's `resources` directory.

2. **Ensure in `server.cfg`**  
   Add the following line to your `server.cfg` to start the resource:
   ```cfg
   ensure Loe-Aipurge
