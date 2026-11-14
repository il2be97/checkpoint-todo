abstract class LevelProgression {
  static const int _baseExp = 1000;

  static int getLevel(double totalExp) {
    int level = 1;
    double remainingExp = totalExp;
    double levelMaxExp = _baseExp.toDouble();

    while (remainingExp >= levelMaxExp) {
      remainingExp -= levelMaxExp;
      level++;
      levelMaxExp *= 1.05;
    }

    return level;
  }

  static int getCurrentExp(double totalExp) {
    double remainingExp = totalExp;
    double levelMaxExp = _baseExp.toDouble();

    while (remainingExp >= levelMaxExp) {
      remainingExp -= levelMaxExp;
      levelMaxExp *= 1.05;
    }

    return remainingExp.round();
  }

  static int getMaxExp(int level) {
    double exp = _baseExp.toDouble();
    for (int i = 1; i < level; i++) {
      exp *= 1.05;
    }
    return exp.round();
  }

  static int getMaxHealth(int level) {
    int hp = 2;
    int threshold = 5;
    int step = 5;

    while (level >= threshold) {
      hp++;
      threshold += step;
      step += 5;
    }

    return hp;
  }
}
