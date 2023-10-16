import numpy as np

def initialize_binary_population(N: int, m: int) -> np.ndarray:
    """
    Initialize a binary population.

    Parameters:
    - N (int): Number of individuals in the population.
    - m (int): Length of each binary chromosome.

    Returns:
    - np.ndarray: Binary population with shape (N, m).
    """
    return np.random.randint(low=2, size=(N, m))

def decode_binary_chromosomes(chromosomes: np.ndarray, d: float) -> np.ndarray:
    """
    Decode binary chromosomes to real-valued variables.

    Parameters:
    - chromosomes (np.ndarray): Binary chromosomes with shape (N, m).
    - d (float): Range of real-valued variables [-d, d].

    Returns:
    - np.ndarray: Decoded real-valued variables with shape (N, 2).
    """
    N, m = chromosomes.shape
    n = 2
    k = int(m / n)
    variable_vector = np.zeros(shape=(N, n))

    for i, chromosome in enumerate(chromosomes):
            first_variable = chromosome[:k]
            second_variable = chromosome[k:]

            x1_tmp = 0
            x2_tmp = 0

            for j, gene in enumerate(first_variable):
                x1_tmp += 2**(-(j+1))*gene

            for j, gene in enumerate(second_variable):
                x2_tmp += 2**(-(j+1))*gene

            x1 = -d + ((2*d) / (1 - (2**(-10))))*x1_tmp
            x2 = -d + ((2*d) / (1 - (2**(-10))))*x2_tmp

            variable_vector[i][0] = x1
            variable_vector[i][1] = x2

    return variable_vector

def get_fitness(decoded_chromosomes: np.ndarray) -> np.ndarray:
    """
    Calculate fitness values for decoded chromosomes.

    Parameters:
    - decoded_chromosomes (np.ndarray): Decoded real-valued variables with shape (N, 2).

    Returns:
    - np.ndarray: Fitness values with shape (N, 1).
    """
    fitness = np.zeros(shape=(decoded_chromosomes.shape[0], 1))

    for i, (x1, x2) in enumerate(decoded_chromosomes):
        function_value = (1.5 - x1 + x1 * x2)**2 + (2.25 - x1 + x1 * x2**2)**2 + (2.625 - x1 + x1 * x2**3)**2
        fitness[i] = 1 / function_value

    return fitness

def select_individuals(N: int, population: np.ndarray, fitness: np.ndarray) -> np.ndarray:
    """
    Select individuals from the population using tournament selection.

    Parameters:
    - N (int): Number of individuals to select.
    - population (np.ndarray): Binary population with shape (N, m).
    - fitness (np.ndarray): Fitness values with shape (N, 1).

    Returns:
    - np.ndarray: Selected individuals with shape (N, m).
    """
    parents = np.empty((N, population.shape[1]))
    for i in range(N):
        tournament_indices = np.random.choice(fitness.shape[0], size=2, replace=False)
        selected_parent_idx = tournament_indices[np.argmax(fitness[tournament_indices])]
        parents[i, :] = population[selected_parent_idx, :]
    return parents

def crossover(parents: np.ndarray) -> np.ndarray:
    """
    Perform crossover on selected parents using single-point crossover.

    Parameters:
    - parents (np.ndarray): Selected individuals with shape (N, m).

    Returns:
    - np.ndarray: Offspring individuals with shape (N, m).
    """
    crossover_point = np.random.randint(1, parents.shape[1] - 1)
    children = np.empty_like(parents)
    for i in range(0, parents.shape[0], 2):
        parent1 = parents[i]
        parent2 = parents[i + 1]
        children[i, :crossover_point] = parent1[:crossover_point]
        children[i, crossover_point:] = parent2[crossover_point:]
        children[i + 1, :crossover_point] = parent2[:crossover_point]
        children[i + 1, crossover_point:] = parent1[crossover_point:]
    return children

def mutate(population: np.ndarray, mutation_rate: float = 0.05) -> np.ndarray:
    """
    Apply mutation to the population with a given mutation rate.

    Parameters:
    - population (np.ndarray): Binary population with shape (N, m).
    - mutation_rate (float): Probability of mutation for each gene.

    Returns:
    - np.ndarray: Mutated population with shape (N, m).
    """
    for i in range(population.shape[0]):
        for j in range(population.shape[1]):
            if np.random.rand() < mutation_rate:
                population[i, j] = 1 - population[i, j]
    return population

if __name__ == '__main__':

    # 0. Set parameters
    n_gen = 10000
    N =  100
    m = 40
    best_fitness = 0

    # 1. Initialize population 
    population = initialize_binary_population(N=N, m=m)
    
    for i in range(n_gen):

        # 2. Evaluate the individuals
        decoded = decode_binary_chromosomes(chromosomes=population, d=3)       # 2.1
        fitness = get_fitness(decoded_chromosomes=decoded)                     # 2.2

        # 3. Form the next generation
        parents = select_individuals(N, population, fitness)       # 3.1
        children = crossover(parents)                               # 3.2
        new_population = mutate(children)                           # 3.3
        population = new_population

        # Calculate best fitness and chromosome
        max_fitness_idx = np.argmax(fitness)
        if fitness[max_fitness_idx] > best_fitness:
            best_fitness = fitness[max_fitness_idx]
            best_chromosome = decoded[max_fitness_idx]

    print(f'Best Fitness: {best_fitness}')
    print(f'Objective Function Value: {1/best_fitness}')
    print(f'Best Decoded Chromosome: {best_chromosome}')


