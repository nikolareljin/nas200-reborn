# Hardware baseline

The NAS200 has upper and lower 3.5-inch SATA bays. Its documented input is
12 V DC at 5 A. SATA drives require both 12 V and regulated 5 V rails; do not
wire a drive or Raspberry Pi directly to 12 V.

The initial design is proposed: Raspberry Pi 3 Model B, two externally powered
SATA-to-USB bridges, fused 12 V distribution, a 5 V buck converter, and an
internal insulated mount. The original panel, backplane, fan, and lid clearance
require donor measurements before reuse.
