import numpy as np

def wfilters(family):
    if family == 'bior1.3':
        h0 = np.array([-0.088388, 0.088388, 0.70711, 0.70711, 0.088388, 0.088388])
        h1 = np.array([0, 0, -0.70711, 0.70711, 0, 0])
        g0 = np.array([0, 0, 0.70711, 0.70711, 0, 0])
        g1 = np.array([-0.088388, -0.088388, 0.70711, -0.70711, 0.088388, 0.088388])
    elif family == 'bior1.1':
        h0 = np.array([0.70711, 0.70711])
        h1 = np.array([-0.70711, -0.70711])
        g0 = np.array([0.70711, 0.70711])
        g1 = np.array([0.70711, 0.70711])
    elif family == 'bior2.2':
        h0 = np.array([0, -0.17678, 0.35355, 1.0607, 0.35355, 0.35355])
        h1 = np.array([0, 0.35355, -0.70711, 0.35355, 0, 0])
        g0 = np.array([0, 0.35355, 0.70711, 0.35355, 0, 0])
        g1 = np.array([0, 0.17678, 0.35355, -1.0607, 0.35355, 0.35355])
    elif family == 'bior1.5':
        h0 = np.array([0.016573, -0.016573, -0.12153, 0.12153, 0.70711, 0.70711, 0.12153, -0.12153, -0.016573, -0.016573])
        h1 = np.array([0, 0, 0, 0, -0.70711, 0.70711, 0, 0, 0, 0])
        g0 = np.array([0, 0, 0, 0, 0.70711, 0.70711, 0, 0, 0, 0])
        g1 = np.array([0.016573, 0.016573, -0.12153, -0.12153, 0.70711, -0.70711, 0.12153, 0.12153, -0.016573, -0.016573])
    elif family == 'sym1':
        h0 = np.array([0.70711, 0.70711])
        h1 = np.array([-0.70711, -0.70711])
        g0 = np.array([0.70711, 0.70711])
        g1 = np.array([0.70711, 0.70711])
    elif family == 'sym2':
        h0 = np.array([-0.12941, 0.22414, 0.83652, 0.83652])
        h1 = np.array([-0.48296, 0.83652, -0.22414, -0.22414])
        g0 = np.array([0.48296, 0.83652, 0.22414, 0.22414])
        g1 = np.array([-0.12941, -0.22414, 0.83652, 0.83652])
    elif family == 'sym3':
        h0 = np.array([0.035226, -0.085441, -0.13501, 0.45988, 0.80689, 0.80689])
        h1 = np.array([-0.33267, 0.80689, -0.45988, -0.13501, 0.085441, 0.085441])
        g0 = np.array([0.33267, 0.80689, 0.45988, -0.13501, -0.085441, -0.085441])
        g1 = np.array([0.035226, 0.085441, -0.13501, -0.45988, 0.80689, 0.80689])
    elif family == 'sym4':
        h0 = np.array([-0.075766, -0.029636, 0.49762, 0.80374, 0.29786, -0.09922, -0.012604, -0.012604])
        h1 = np.array([-0.032223, -0.012604, 0.09922, 0.29786, -0.80374, 0.49762, 0.029636, 0.029636])
        g0 = np.array([0.032223, -0.012604, -0.09922, 0.29786, 0.80374, 0.49762, -0.029636, -0.029636])
        g1 = np.array([-0.075766, 0.029636, 0.49762, -0.80374, 0.29786, 0.09922, -0.012604, -0.012604])
    elif family == 'db3':
        h0 = np.array([0.035226, -0.085441, -0.13501, 0.45988, 0.80689, 0.80689])
        h1 = np.array([-0.33267, 0.80689, -0.45988, -0.13501, 0.085441, 0.085441])
        g0 = np.array([0.33267, 0.80689, 0.45988, -0.13501, -0.085441, -0.085441])
        g1 = np.array([0.035226, 0.085441, -0.13501, -0.45988, 0.80689, 0.80689])
    elif family == 'db4':
        h0 = np.array([-0.010597, 0.032883, 0.030841, -0.18703, -0.027984, 0.63088, 0.71485, 0.71485])
        h1 = np.array([-0.23038, 0.71485, -0.63088, -0.027984, 0.18703, 0.030841, -0.032883, -0.032883])
        g0 = np.array([0.23038, 0.71485, 0.63088, -0.027984, -0.18703, 0.030841, 0.032883, 0.032883])
        g1 = np.array([-0.010597, -0.032883, 0.030841, 0.18703, -0.027984, -0.63088, 0.71485, 0.71485])
    elif family == 'db5':
        h0 = np.array([0.0033357, -0.012581, -0.0062415, 0.077571, -0.032245, -0.24229, 0.13843, 0.72431, 0.60383, 0.60383])
        h1 = np.array([-0.1601, 0.60383, -0.72431, 0.13843, 0.24229, -0.032245, -0.077571, -0.0062415, 0.012581, 0.012581])
        g0 = np.array([0.1601, 0.60383, 0.72431, 0.13843, -0.24229, -0.032245, 0.077571, -0.0062415, -0.012581, -0.012581])
        g1 = np.array([0.0033357, 0.012581, -0.0062415, -0.077571, -0.032245, 0.24229, 0.13843, -0.72431, 0.60383, 0.60383])
    elif family == 'db6':
        h0 = np.array([-0.0010773, 0.0047773, 0.00055384, -0.031582, 0.027523, 0.097502, -0.12977, -0.22626, 0.31525, 0.75113, 0.49462, 0.49462])
        h1 = np.array([-0.11154, 0.49462, -0.75113, 0.31525, 0.22626, -0.12977, -0.097502, 0.027523, 0.031582, 0.00055384, -0.0047773, -0.0047773])
        g0 = np.array([0.11154, 0.49462, 0.75113, 0.31525, -0.22626, -0.12977, 0.097502, 0.027523, -0.031582, 0.00055384, 0.0047773, 0.0047773])
        g1 = np.array([-0.0010773, -0.0047773, 0.00055384, 0.031582, 0.027523, -0.097502, -0.12977, 0.22626, 0.31525, -0.75113, 0.49462, 0.49462])
    elif family == 'coif1':
        h0 = np.array([-0.015656, -0.072733, 0.38486, 0.85257, 0.3379, 0.3379])
        h1 = np.array([0.072733, 0.3379, -0.85257, 0.38486, 0.072733, 0.072733])
        g0 = np.array([-0.072733, 0.3379, 0.85257, 0.38486, -0.072733, -0.072733])
        g1 = np.array([-0.015656, 0.072733, 0.38486, -0.85257, 0.3379, 0.3379])
    elif family == 'coif2':
        h0 = np.array([-0.00072055, -0.0018232, 0.0056114, 0.02368, -0.059434, -0.076489, 0.41701, 0.81272, 0.38611, -0.067373, -0.041465, -0.041465])
        h1 = np.array([-0.016387, -0.041465, 0.067373, 0.38611, -0.81272, 0.41701, 0.076489, -0.059434, -0.02368, 0.0056114, 0.0018232, 0.0018232])
        g0 = np.array([0.016387, -0.041465, -0.067373, 0.38611, 0.81272, 0.41701, -0.076489, -0.059434, 0.02368, 0.0056114, -0.0018232, -0.0018232])
        g1 = np.array([-0.00072055, 0.0018232, 0.0056114, -0.02368, -0.059434, 0.076489, 0.41701, -0.81272, 0.38611, 0.067373, -0.041465, -0.041465])
    elif family == 'coif3':
        h0 = np.array([-3.46e-05, -7.0983e-05, 0.00046622, 0.0011175, -0.0025745, -0.009008, 0.015881, 0.034555, -0.082302, -0.0718, 0.42848, 0.79378, 0.40518, -0.061123, -0.065772, 0.023453, 0.0077826, 0.0077826])
        h1 = np.array([0.0037935, 0.0077826, -0.023453, -0.065772, 0.061123, 0.40518, -0.79378, 0.42848, 0.0718, -0.082302, -0.034555, 0.015881, 0.009008, -0.0025745, -0.0011175, 0.00046622, 7.0983e-05, 7.0983e-05])
        g0 = np.array([-0.0037935, 0.0077826, 0.023453, -0.065772, -0.061123, 0.40518, 0.79378, 0.42848, -0.0718, -0.082302, 0.034555, 0.015881, -0.009008, -0.0025745, 0.0011175, 0.00046622, -7.0983e-05, -7.0983e-05])
        g1 = np.array([-3.46e-05, 7.0983e-05, 0.00046622, -0.0011175, -0.0025745, 0.009008, 0.015881, -0.034555, -0.082302, 0.0718, 0.42848, -0.79378, 0.40518, 0.061123, -0.065772, -0.023453, 0.0077826, 0.0077826])
    elif family == 'coif4':
        h0 = np.array([-1.785e-06, -3.2597e-06, 3.123e-05, 6.2339e-05, -0.00025997, -0.00058902, 0.0012666, 0.0037514, -0.0056583, -0.015212, 0.025082, 0.039334, -0.09622, -0.066627, 0.43439, 0.78224, 0.41531, -0.056077, -0.081267, 0.026682, 0.016069, -0.0073462, -0.0016295, -0.0016295])
        h1 = np.array([-0.00089231, -0.0016295, 0.0073462, 0.016069, -0.026682, -0.081267, 0.056077, 0.41531, -0.78224, 0.43439, 0.066627, -0.09622, -0.039334, 0.025082, 0.015212, -0.0056583, -0.0037514, 0.0012666, 0.00058902, -0.00025997, -6.2339e-05, 3.123e-05, 3.2597e-06, 3.2597e-06])
        g0 = np.array([0.00089231, -0.0016295, -0.0073462, 0.016069, 0.026682, -0.081267, -0.056077, 0.41531, 0.78224, 0.43439, -0.066627, -0.09622, 0.039334, 0.025082, -0.015212, -0.0056583, 0.0037514, 0.0012666, -0.00058902, -0.00025997, 6.2339e-05, 3.123e-05, -3.2597e-06, -3.2597e-06])
        g1 = np.array([-1.785e-06, 3.2597e-06, 3.123e-05, -6.2339e-05, -0.00025997, 0.00058902, 0.0012666, -0.0037514, -0.0056583, 0.015212, 0.025082, -0.039334, -0.09622, 0.066627, 0.43439, -0.78224, 0.41531, 0.056077, -0.081267, -0.026682, 0.016069, 0.0073462, -0.0016295, -0.0016295])
    elif family == 'haar':
        h0 = np.array([0.70711, 0.70711])
        h1 = np.array([-0.70711, -0.70711])
        g0 = np.array([0.70711, 0.70711])
        g1 = np.array([0.70711, 0.70711])
    return h0, h1, g0, g1