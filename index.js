#!/usr/bin/env node

class Project {
  #count = 0;

  increase() {
    this.#count++;
  }

  get count() {
    return this.#count;
  }
}

// Public API for terminal usage
function init() {
  const project = new Project();

  console.log("🚀 Project initialized!");
  console.log(`Initial count: ${project.count}`);

  // Demonstrate the functionality
  project.increase();
  console.log(`Count after increase: ${project.count}`);

  project.increase();
  console.log(`Count after another increase: ${project.count}`);

  return project;
}

// Export for module usage
module.exports = { Project, init };
