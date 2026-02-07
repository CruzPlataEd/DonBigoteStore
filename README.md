# Part 2: "Don Bigotes" App 🐱

In this part, you will create a new application. The app will display information about a fictional pet store chain called "Don Bigotes" (Mr. Whiskers).

---

## General Description

The application will have **3 screens**:

1. **Home Screen**: Chain information and button to view branches
2. **Branch List**: TableView with all branches
3. **Branch Detail**: Complete information with integrated map

---

## 2.1 Initial Setup (5 points)

### Requirements
- [ ] Create a new Xcode project called "DonBigotes"
- [ ] Configure the project to use **programmatic UIKit**
- [ ] Configure `SceneDelegate` to start the app programmatically
- [ ] Add the `don_bigotes.json` file to the project
- [ ] Add location permission in `Info.plist`

---

## 2.2 Data Models (15 points)

### Requirements
- [ ] Create the necessary models to decode the JSON
- [ ] All models must conform to `Codable`
- [ ] Correctly handle days that are closed

---

## 2.3 Home Screen (20 points)

### Requirements
- [ ] Create `HomeViewController` programmatically
- [ ] Create `HomeViewModel` to manage data
- [ ] Display:
  - Store logo (image from URL or placeholder)
  - Chain name (large font)
  - Slogan
  - Description (in a scroll view if necessary)
  - "View Branches" button
- [ ] The button must navigate to the branch list


## 2.4 Branch List (20 points)

### Requirements
- [ ] Create `BranchListTableViewController`
- [ ] Create `BranchListViewModel`
- [ ] Each cell must show:
  - Branch name
  - Address
- [ ] When selecting a cell, navigate to the branch detail
- [ ] Navigation must be with **push** (inside a `UINavigationController`)

---

## 2.5 Branch Detail with Map (40 points)

### Requirements
- [ ] Create `BranchDetailViewController` programmatically
- [ ] Create `BranchDetailViewModel`
- [ ] The screen must show **in the same view**:
  - Branch name
  - Full address
  - Phone number
  - Opening hours (Monday-Friday, Saturday, Sunday)
  - If a day is closed, show "Closed"
  - List of available services
  - **Map with the branch location**
- [ ] The map must:
  - Show a **pin** at the branch location
  - Have an **appropriate zoom** to clearly see the location
  - **NOT** need to show user location
- [ ] The design must use `UIScrollView` to allow scrolling if content is long
- [ ] The map must have a fixed size (e.g., 300 pts height)

---

## Suggested Project Structure

```
DonBigotes/
├── AppDelegate.swift
├── SceneDelegate.swift
├── Models/
│   ├── Store.swift
│   ├── Branch.swift
│   └── OpeningHours.swift
├── Home/
│   ├── HomeViewController.swift
│   └── HomeViewModel.swift
├── BranchList/
│   ├── BranchListViewController.swift
│   └── BranchListViewModel.swift
├── BranchDetail/
│   ├── BranchDetailViewController.swift
│   └── BranchDetailViewModel.swift
├── Resources/
│   └── don_bigotes.json
└── Info.plist
```
