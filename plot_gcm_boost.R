#!/usr/bin/Rscript --vanilla
mygrid <- function(xl,yl)
{
		for (x in xl)
					segments(x, yl[1], x, tail(yl, 1), lty="dotted",
					col="lightgrey");
						for (y in yl)
									segments(xl[1], y, tail(xl, 1), y,
									lty="dotted", col="lightgrey");
}

postscript(file="eps/gcm3d-boost.eps",
           paper="special",
           width=10,
           height=10,
           horizontal=FALSE)
procs <- c(1, 2, 3, 4, 6, 8, 12, 24)
times <- c(22, 11+7/60, 7+32/60, 5+45/60, 3+55/60, 2+57/60, 2+0/60, 1+2/60)
boost <- times[1]/times
plot(procs, procs, type="l",  lwd=3, lty=2, col="red", axes=F, ann=F)
lines(procs, boost,  lwd=3, type="o")
axis(2, las=1, at=seq(1,24))
axis(1, las=1, at=procs)
mygrid(procs, seq(1,24))
title("Зависимость производительности от числа процессоров", xlab="Число процессоров", 
ylab="Рост производительности в X раз")
dev.off()

postscript(file="eps/gcm3d-efficiency.eps",
           paper="special",
           width=10,
           height=4,
           horizontal=FALSE)
eff <- boost/procs
print(eff)
plot(procs, eff, type="o", col="black", ylim=c(0.8, 1.0), lwd=3, axes=F, ann=F)
mygrid(procs, seq(0.8, 1.0, 0.05))
axis(2, las=1, at=seq(0.8, 1.0, by=0.05))
axis(1, las=1, at=procs)
title("Эффективность параллельного кода", 
xlab="Число процессоров", ylab="Эффективность")
dev.off()
